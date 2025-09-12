// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

/**
 * @title Chainhive Project Contract
 * @dev A decentralized platform for collaborative project management and funding
 * @author Chainhive Team
 */
contract Project {
    
    // Struct to represent a project
    struct ProjectInfo {
        uint256 id;
        string name;
        string description;
        address creator;
        uint256 fundingGoal;
        uint256 currentFunding;
        uint256 deadline;
        bool isActive;
        bool isCompleted;
        mapping(address => uint256) contributions;
        address[] contributors;
    }
    
    // Struct for project milestones
    struct Milestone {
        string description;
        uint256 amount;
        bool isCompleted;
        uint256 votesFor;
        uint256 votesAgainst;
        mapping(address => bool) hasVoted;
    }
    
    // State variables
    uint256 private projectCounter;
    mapping(uint256 => ProjectInfo) public projects;
    mapping(uint256 => Milestone[]) public projectMilestones;
    mapping(address => uint256[]) public userProjects;
    
    // Events
    event ProjectCreated(uint256 indexed projectId, address indexed creator, string name, uint256 fundingGoal);
    event ProjectFunded(uint256 indexed projectId, address indexed contributor, uint256 amount);
    event MilestoneCompleted(uint256 indexed projectId, uint256 milestoneIndex);
    event FundsWithdrawn(uint256 indexed projectId, uint256 amount);
    
    // Modifiers
    modifier onlyProjectCreator(uint256 _projectId) {
        require(projects[_projectId].creator == msg.sender, "Only project creator can perform this action");
        _;
    }
    
    modifier projectExists(uint256 _projectId) {
        require(_projectId > 0 && _projectId <= projectCounter, "Project does not exist");
        _;
    }
    
    modifier projectActive(uint256 _projectId) {
        require(projects[_projectId].isActive, "Project is not active");
        require(block.timestamp <= projects[_projectId].deadline, "Project deadline has passed");
        _;
    }
    
    /**
     * @dev Creates a new project with funding goal and deadline
     * @param _name Project name
     * @param _description Project description
     * @param _fundingGoal Target funding amount in wei
     * @param _durationDays Project duration in days
     */
    function createProject(
        string memory _name,
        string memory _description,
        uint256 _fundingGoal,
        uint256 _durationDays
    ) external returns (uint256) {
        require(bytes(_name).length > 0, "Project name cannot be empty");
        require(_fundingGoal > 0, "Funding goal must be greater than 0");
        require(_durationDays > 0, "Duration must be greater than 0");
        
        projectCounter++;
        uint256 deadline = block.timestamp + (_durationDays * 1 days);
        
        ProjectInfo storage newProject = projects[projectCounter];
        newProject.id = projectCounter;
        newProject.name = _name;
        newProject.description = _description;
        newProject.creator = msg.sender;
        newProject.fundingGoal = _fundingGoal;
        newProject.currentFunding = 0;
        newProject.deadline = deadline;
        newProject.isActive = true;
        newProject.isCompleted = false;
        
        userProjects[msg.sender].push(projectCounter);
        
        emit ProjectCreated(projectCounter, msg.sender, _name, _fundingGoal);
        return projectCounter;
    }
    
    /**
     * @dev Allows users to fund a project
     * @param _projectId The ID of the project to fund
     */
    function fundProject(uint256 _projectId) 
        external 
        payable 
        projectExists(_projectId) 
        projectActive(_projectId) 
    {
        require(msg.value > 0, "Funding amount must be greater than 0");
        
        ProjectInfo storage project = projects[_projectId];
        
        // Add contributor if first time funding
        if (project.contributions[msg.sender] == 0) {
            project.contributors.push(msg.sender);
        }
        
        project.contributions[msg.sender] += msg.value;
        project.currentFunding += msg.value;
        
        // Check if funding goal is reached
        if (project.currentFunding >= project.fundingGoal) {
            project.isCompleted = true;
        }
        
        emit ProjectFunded(_projectId, msg.sender, msg.value);
    }
    
    /**
     * @dev Allows project creator to withdraw funds based on milestone completion
     * @param _projectId The ID of the project
     * @param _amount Amount to withdraw
     */
    function withdrawFunds(uint256 _projectId, uint256 _amount) 
        external 
        projectExists(_projectId) 
        onlyProjectCreator(_projectId) 
    {
        ProjectInfo storage project = projects[_projectId];
        require(project.currentFunding >= _amount, "Insufficient funds");
        require(_amount > 0, "Withdrawal amount must be greater than 0");
        
        // Simple withdrawal logic - in production, this should be tied to milestone completion
        project.currentFunding -= _amount;
        
        (bool success, ) = payable(msg.sender).call{value: _amount}("");
        require(success, "Transfer failed");
        
        emit FundsWithdrawn(_projectId, _amount);
    }
    
    // View functions
    function getProject(uint256 _projectId) 
        external 
        view 
        projectExists(_projectId) 
        returns (
            uint256 id,
            string memory name,
            string memory description,
            address creator,
            uint256 fundingGoal,
            uint256 currentFunding,
            uint256 deadline,
            bool isActive,
            bool isCompleted
        ) 
    {
        ProjectInfo storage project = projects[_projectId];
        return (
            project.id,
            project.name,
            project.description,
            project.creator,
            project.fundingGoal,
            project.currentFunding,
            project.deadline,
            project.isActive,
            project.isCompleted
        );
    }
    
    function getProjectContributors(uint256 _projectId) 
        external 
        view 
        projectExists(_projectId) 
        returns (address[] memory) 
    {
        return projects[_projectId].contributors;
    }
    
    function getUserContribution(uint256 _projectId, address _user) 
        external 
        view 
        projectExists(_projectId) 
        returns (uint256) 
    {
        return projects[_projectId].contributions[_user];
    }
    
    function getTotalProjects() external view returns (uint256) {
        return projectCounter;
    }
    
    function getUserProjects(address _user) external view returns (uint256[] memory) {
        return userProjects[_user];
    }
}
