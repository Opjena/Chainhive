import React, { useState, useEffect } from 'react';
import { Rocket, Wallet, TrendingUp, Users, Clock, Target, Plus, Search, Filter } from 'lucide-react';

const ChainHiveDApp = () => {
  const [isWalletConnected, setIsWalletConnected] = useState(false);
  const [walletAddress, setWalletAddress] = useState('');
  const [activeTab, setActiveTab] = useState('explore');
  const [projects, setProjects] = useState([
    {
      id: 1,
      name: "DeFi Education Platform",
      description: "Building a comprehensive platform to educate newcomers about DeFi",
      creator: "0x742d...9fE3",
      fundingGoal: 50,
      currentFunding: 32.5,
      deadline: "15 days",
      contributors: 127,
      category: "Education"
    },
    {
      id: 2,
      name: "NFT Marketplace for Artists",
      description: "A decentralized marketplace focused on supporting independent artists",
      creator: "0x8a3b...2cD1",
      fundingGoal: 100,
      currentFunding: 78.3,
      deadline: "8 days",
      contributors: 234,
      category: "NFT"
    },
    {
      id: 3,
      name: "Climate Action DAO",
      description: "Community-driven initiatives for environmental sustainability",
      creator: "0x1f5e...7aB9",
      fundingGoal: 75,
      currentFunding: 45.2,
      deadline: "22 days",
      contributors: 189,
      category: "Social Impact"
    },
    {
      id: 4,
      name: "Gaming Metaverse Development",
      description: "Creating an open-world metaverse with player-owned economies",
      creator: "0x9c2d...4fE8",
      fundingGoal: 150,
      currentFunding: 92.7,
      deadline: "12 days",
      contributors: 456,
      category: "Gaming"
    }
  ]);
  const [showCreateModal, setShowCreateModal] = useState(false);
  const [selectedProject, setSelectedProject] = useState(null);
  const [searchTerm, setSearchTerm] = useState('');
  const [filterCategory, setFilterCategory] = useState('All');

  const connectWallet = async () => {
    // Simulate wallet connection
    setIsWalletConnected(true);
    setWalletAddress('0x742d35Cc6634C0532925a3b844Bc9e7595f9fE3');
  };

  const disconnectWallet = () => {
    setIsWalletConnected(false);
    setWalletAddress('');
  };

  const calculateProgress = (current, goal) => {
    return Math.min((current / goal) * 100, 100);
  };

  const filteredProjects = projects.filter(project => {
    const matchesSearch = project.name.toLowerCase().includes(searchTerm.toLowerCase()) ||
                         project.description.toLowerCase().includes(searchTerm.toLowerCase());
    const matchesCategory = filterCategory === 'All' || project.category === filterCategory;
    return matchesSearch && matchesCategory;
  });

  const CreateProjectModal = () => (
    <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50 p-4">
      <div className="bg-white rounded-2xl max-w-2xl w-full max-h-[90vh] overflow-y-auto">
        <div className="p-6">
          <div className="flex justify-between items-center mb-6">
            <h2 className="text-2xl font-bold text-gray-900">Create New Project</h2>
            <button onClick={() => setShowCreateModal(false)} className="text-gray-500 hover:text-gray-700">
              <svg className="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" />
              </svg>
            </button>
          </div>

          <div className="space-y-4">
            <div>
              <label className="block text-sm font-medium text-gray-700 mb-2">Project Name</label>
              <input type="text" className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-purple-500 focus:border-transparent" placeholder="Enter project name" />
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-2">Description</label>
              <textarea className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-purple-500 focus:border-transparent" rows="4" placeholder="Describe your project"></textarea>
            </div>

            <div>
              <label className="block text-sm font-medium text-gray-700 mb-2">Category</label>
              <select className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-purple-500 focus:border-transparent">
                <option>Education</option>
                <option>NFT</option>
                <option>Gaming</option>
                <option>Social Impact</option>
                <option>DeFi</option>
              </select>
            </div>

            <div className="grid grid-cols-2 gap-4">
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">Funding Goal (ETH)</label>
                <input type="number" className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-purple-500 focus:border-transparent" placeholder="50" />
              </div>
              <div>
                <label className="block text-sm font-medium text-gray-700 mb-2">Duration (Days)</label>
                <input type="number" className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-purple-500 focus:border-transparent" placeholder="30" />
              </div>
            </div>

            <button className="w-full bg-gradient-to-r from-purple-600 to-pink-600 text-white py-3 rounded-lg font-semibold hover:shadow-lg transition-all duration-300">
              Create Project
            </button>
          </div>
        </div>
      </div>
    </div>
  );

  const ProjectDetailModal = ({ project }) => (
    <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50 p-4">
      <div className="bg-white rounded-2xl max-w-3xl w-full max-h-[90vh] overflow-y-auto">
        <div className="p-6">
          <div className="flex justify-between items-start mb-6">
            <div>
              <h2 className="text-3xl font-bold text-gray-900 mb-2">{project.name}</h2>
              <span className="px-3 py-1 bg-purple-100 text-purple-700 rounded-full text-sm font-medium">
                {project.category}
              </span>
            </div>
            <button onClick={() => setSelectedProject(null)} className="text-gray-500 hover:text-gray-700">
              <svg className="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
                <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M6 18L18 6M6 6l12 12" />
              </svg>
            </button>
          </div>

          <div className="space-y-6">
            <div>
              <h3 className="text-lg font-semibold text-gray-900 mb-2">Description</h3>
              <p className="text-gray-600">{project.description}</p>
            </div>

            <div className="bg-gradient-to-br from-purple-50 to-pink-50 rounded-xl p-6">
              <div className="flex justify-between items-center mb-4">
                <span className="text-2xl font-bold text-gray-900">{project.currentFunding} ETH</span>
                <span className="text-gray-600">of {project.fundingGoal} ETH</span>
              </div>
              <div className="w-full bg-gray-200 rounded-full h-3 mb-4">
                <div 
                  className="bg-gradient-to-r from-purple-600 to-pink-600 h-3 rounded-full transition-all duration-500"
                  style={{ width: `${calculateProgress(project.currentFunding, project.fundingGoal)}%` }}
                />
              </div>
              <div className="grid grid-cols-3 gap-4 text-center">
                <div>
                  <div className="text-2xl font-bold text-purple-600">{project.contributors}</div>
                  <div className="text-sm text-gray-600">Contributors</div>
                </div>
                <div>
                  <div className="text-2xl font-bold text-purple-600">{project.deadline}</div>
                  <div className="text-sm text-gray-600">Remaining</div>
                </div>
                <div>
                  <div className="text-2xl font-bold text-purple-600">{Math.round(calculateProgress(project.currentFunding, project.fundingGoal))}%</div>
                  <div className="text-sm text-gray-600">Funded</div>
                </div>
              </div>
            </div>

            <div>
              <h3 className="text-lg font-semibold text-gray-900 mb-2">Project Creator</h3>
              <div className="flex items-center space-x-3">
                <div className="w-10 h-10 bg-gradient-to-br from-purple-400 to-pink-400 rounded-full"></div>
                <span className="font-mono text-gray-600">{project.creator}</span>
              </div>
            </div>

            <div className="space-y-3">
              <label className="block text-sm font-medium text-gray-700">Contribution Amount (ETH)</label>
              <input type="number" className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-purple-500 focus:border-transparent" placeholder="0.1" step="0.01" />
              <button className="w-full bg-gradient-to-r from-purple-600 to-pink-600 text-white py-3 rounded-lg font-semibold hover:shadow-lg transition-all duration-300">
                Fund This Project
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  );

  return (
    <div className="min-h-screen bg-gradient-to-br from-purple-50 via-white to-pink-50">
      {/* Header */}
      <header className="bg-white border-b border-gray-200 sticky top-0 z-40 backdrop-blur-lg bg-opacity-90">
        <div className="max-w-7xl mx-auto px-4 py-4">
          <div className="flex items-center justify-between">
            <div className="flex items-center space-x-3">
              <div className="w-10 h-10 bg-gradient-to-br from-purple-600 to-pink-600 rounded-lg flex items-center justify-center">
                <Rocket className="w-6 h-6 text-white" />
              </div>
              <span className="text-2xl font-bold bg-gradient-to-r from-purple-600 to-pink-600 bg-clip-text text-transparent">
                Chainhive
              </span>
            </div>

            <nav className="hidden md:flex space-x-8">
              <button onClick={() => setActiveTab('explore')} className={`${activeTab === 'explore' ? 'text-purple-600 font-semibold' : 'text-gray-600'} hover:text-purple-600 transition-colors`}>
                Explore
              </button>
              <button onClick={() => setActiveTab('myprojects')} className={`${activeTab === 'myprojects' ? 'text-purple-600 font-semibold' : 'text-gray-600'} hover:text-purple-600 transition-colors`}>
                My Projects
              </button>
              <button onClick={() => setActiveTab('about')} className={`${activeTab === 'about' ? 'text-purple-600 font-semibold' : 'text-gray-600'} hover:text-purple-600 transition-colors`}>
                About
              </button>
            </nav>

            <div className="flex items-center space-x-4">
              {isWalletConnected ? (
                <div className="flex items-center space-x-3">
                  <div className="hidden md:flex items-center space-x-2 bg-gradient-to-r from-purple-100 to-pink-100 px-4 py-2 rounded-lg">
                    <Wallet className="w-4 h-4 text-purple-600" />
                    <span className="font-mono text-sm text-gray-700">
                      {walletAddress.slice(0, 6)}...{walletAddress.slice(-4)}
                    </span>
                  </div>
                  <button onClick={disconnectWallet} className="text-sm text-gray-600 hover:text-gray-900">
                    Disconnect
                  </button>
                </div>
              ) : (
                <button onClick={connectWallet} className="bg-gradient-to-r from-purple-600 to-pink-600 text-white px-6 py-2 rounded-lg font-semibold hover:shadow-lg transition-all duration-300">
                  Connect Wallet
                </button>
              )}
            </div>
          </div>
        </div>
      </header>

      {/* Hero Section */}
      {activeTab === 'explore' && (
        <div className="bg-gradient-to-br from-purple-600 via-purple-700 to-pink-600 text-white py-16">
          <div className="max-w-7xl mx-auto px-4">
            <div className="text-center mb-8">
              <h1 className="text-5xl font-bold mb-4">Fund the Future of Innovation</h1>
              <p className="text-xl text-purple-100 mb-8">Decentralized project funding powered by blockchain technology</p>
              {isWalletConnected && (
                <button onClick={() => setShowCreateModal(true)} className="bg-white text-purple-600 px-8 py-3 rounded-lg font-semibold hover:shadow-xl transition-all duration-300 inline-flex items-center space-x-2">
                  <Plus className="w-5 h-5" />
                  <span>Create Project</span>
                </button>
              )}
            </div>

            <div className="grid grid-cols-1 md:grid-cols-3 gap-6 mt-12">
              <div className="bg-white bg-opacity-10 backdrop-blur-lg rounded-xl p-6 text-center">
                <TrendingUp className="w-12 h-12 mx-auto mb-4" />
                <div className="text-3xl font-bold mb-2">$2.4M+</div>
                <div className="text-purple-100">Total Funded</div>
              </div>
              <div className="bg-white bg-opacity-10 backdrop-blur-lg rounded-xl p-6 text-center">
                <Users className="w-12 h-12 mx-auto mb-4" />
                <div className="text-3xl font-bold mb-2">1,200+</div>
                <div className="text-purple-100">Contributors</div>
              </div>
              <div className="bg-white bg-opacity-10 backdrop-blur-lg rounded-xl p-6 text-center">
                <Rocket className="w-12 h-12 mx-auto mb-4" />
                <div className="text-3xl font-bold mb-2">156</div>
                <div className="text-purple-100">Active Projects</div>
              </div>
            </div>
          </div>
        </div>
      )}

      {/* Main Content */}
      <div className="max-w-7xl mx-auto px-4 py-12">
        {activeTab === 'explore' && (
          <>
            {/* Search and Filter */}
            <div className="mb-8 flex flex-col md:flex-row gap-4">
              <div className="flex-1 relative">
                <Search className="absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400 w-5 h-5" />
                <input
                  type="text"
                  placeholder="Search projects..."
                  value={searchTerm}
                  onChange={(e) => setSearchTerm(e.target.value)}
                  className="w-full pl-10 pr-4 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-purple-500 focus:border-transparent"
                />
              </div>
              <div className="relative">
                <Filter className="absolute left-3 top-1/2 transform -translate-y-1/2 text-gray-400 w-5 h-5" />
                <select
                  value={filterCategory}
                  onChange={(e) => setFilterCategory(e.target.value)}
                  className="pl-10 pr-8 py-3 border border-gray-300 rounded-lg focus:ring-2 focus:ring-purple-500 focus:border-transparent appearance-none bg-white"
                >
                  <option>All</option>
                  <option>Education</option>
                  <option>NFT</option>
                  <option>Gaming</option>
                  <option>Social Impact</option>
                  <option>DeFi</option>
                </select>
              </div>
            </div>

            {/* Projects Grid */}
            <div className="grid grid-cols-1 md:grid-cols-2 gap-6">
              {filteredProjects.map(project => (
                <div key={project.id} className="bg-white rounded-xl shadow-md hover:shadow-xl transition-shadow duration-300 overflow-hidden">
                  <div className="p-6">
                    <div className="flex justify-between items-start mb-4">
                      <h3 className="text-xl font-bold text-gray-900">{project.name}</h3>
                      <span className="px-3 py-1 bg-purple-100 text-purple-700 rounded-full text-xs font-medium">
                        {project.category}
                      </span>
                    </div>
                    <p className="text-gray-600 mb-4 line-clamp-2">{project.description}</p>
                    
                    <div className="mb-4">
                      <div className="flex justify-between text-sm text-gray-600 mb-2">
                        <span>{project.currentFunding} ETH raised</span>
                        <span>{project.fundingGoal} ETH goal</span>
                      </div>
                      <div className="w-full bg-gray-200 rounded-full h-2">
                        <div 
                          className="bg-gradient-to-r from-purple-600 to-pink-600 h-2 rounded-full transition-all duration-500"
                          style={{ width: `${calculateProgress(project.currentFunding, project.fundingGoal)}%` }}
                        />
                      </div>
                    </div>

                    <div className="flex items-center justify-between text-sm text-gray-600 mb-4">
                      <div className="flex items-center space-x-1">
                        <Users className="w-4 h-4" />
                        <span>{project.contributors} contributors</span>
                      </div>
                      <div className="flex items-center space-x-1">
                        <Clock className="w-4 h-4" />
                        <span>{project.deadline} left</span>
                      </div>
                    </div>

                    <button 
                      onClick={() => setSelectedProject(project)}
                      className="w-full bg-gradient-to-r from-purple-600 to-pink-600 text-white py-2 rounded-lg font-semibold hover:shadow-lg transition-all duration-300"
                    >
                      View Project
                    </button>
                  </div>
                </div>
              ))}
            </div>
          </>
        )}

        {activeTab === 'myprojects' && (
          <div className="text-center py-16">
            {isWalletConnected ? (
              <div>
                <Target className="w-16 h-16 mx-auto text-gray-400 mb-4" />
                <h2 className="text-2xl font-bold text-gray-900 mb-2">No Projects Yet</h2>
                <p className="text-gray-600 mb-6">Start your journey by creating your first project</p>
                <button onClick={() => setShowCreateModal(true)} className="bg-gradient-to-r from-purple-600 to-pink-600 text-white px-8 py-3 rounded-lg font-semibold hover:shadow-lg transition-all duration-300 inline-flex items-center space-x-2">
                  <Plus className="w-5 h-5" />
                  <span>Create Project</span>
                </button>
              </div>
            ) : (
              <div>
                <Wallet className="w-16 h-16 mx-auto text-gray-400 mb-4" />
                <h2 className="text-2xl font-bold text-gray-900 mb-2">Connect Your Wallet</h2>
                <p className="text-gray-600 mb-6">Connect your wallet to view and manage your projects</p>
                <button onClick={connectWallet} className="bg-gradient-to-r from-purple-600 to-pink-600 text-white px-8 py-3 rounded-lg font-semibold hover:shadow-lg transition-all duration-300">
                  Connect Wallet
                </button>
              </div>
            )}
          </div>
        )}

        {activeTab === 'about' && (
          <div className="max-w-3xl mx-auto">
            <h2 className="text-3xl font-bold text-gray-900 mb-6">About Chainhive</h2>
            <div className="bg-white rounded-xl shadow-md p-8 space-y-6">
              <p className="text-gray-600 leading-relaxed">
                Chainhive is a decentralized platform that revolutionizes project funding through blockchain technology. We enable creators to launch projects and receive support from a global community while maintaining complete transparency and trust.
              </p>
              <div className="border-t border-gray-200 pt-6">
                <h3 className="text-xl font-bold text-gray-900 mb-4">Key Features</h3>
                <ul className="space-y-3 text-gray-600">
                  <li className="flex items-start space-x-3">
                    <div className="w-6 h-6 bg-purple-100 rounded-full flex items-center justify-center flex-shrink-0 mt-0.5">
                      <div className="w-2 h-2 bg-purple-600 rounded-full"></div>
                    </div>
                    <span>Decentralized project creation and funding</span>
                  </li>
                  <li className="flex items-start space-x-3">
                    <div className="w-6 h-6 bg-purple-100 rounded-full flex items-center justify-center flex-shrink-0 mt-0.5">
                      <div className="w-2 h-2 bg-purple-600 rounded-full"></div>
                    </div>
                    <span>Smart contract-based fund management</span>
                  </li>
                  <li className="flex items-start space-x-3">
                    <div className="w-6 h-6 bg-purple-100 rounded-full flex items-center justify-center flex-shrink-0 mt-0.5">
                      <div className="w-2 h-2 bg-purple-600 rounded-full"></div>
                    </div>
                    <span>Complete transparency and security</span>
                  </li>
                  <li className="flex items-start space-x-3">
                    <div className="w-6 h-6 bg-purple-100 rounded-full flex items-center justify-center flex-shrink-0 mt-0.5">
                      <div className="w-2 h-2 bg-purple-600 rounded-full"></div>
                    </div>
                    <span>Community-driven governance</span>
                  </li>
                </ul>
              </div>
            </div>
          </div>
        )}
      </div>

      {/* Modals */}
      {showCreateModal && <CreateProjectModal />}
      {selectedProject && <ProjectDetailModal project={selectedProject} />}
    </div>
  );
};

export default ChainHiveDApp;
