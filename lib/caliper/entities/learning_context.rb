##
# This file is part of IMS Caliper Analytics™ and is licensed to
# IMS Global Learning Consortium, Inc. (http://www.imsglobal.org)
# under one or more contributor license agreements.  See the NOTICE
# file distributed with this work for additional information.
#
# IMS Caliper is free software: you can redistribute it and/or modify it under
# the terms of the GNU Lesser General Public License as published by the Free
# Software Foundation, version 3 of the License.
#
# IMS Caliper is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE.  See the GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License along
# with this program. If not, see http://www.gnu.org/licenses/.

require "json"
require_relative 'entity'
require_relative 'agent/software_application'
require_relative 'agent/organization'
require_relative 'foaf/agent'

#
# Learning Context.
#
module Caliper
  module Entities
    class LearningContext < Entity
	    attr_accessor :ed_app, # SoftwareApplication educational app
                    :group, # W3C Organization
	                  :agent # Agent the agent, since the Agent module is empty for now, use Entity type
	    def initialize
		    super
		    @ed_app = Caliper::Entities::Agent::SoftwareApplication.new
		    @group = Caliper::Entities::Agent::Organization.new
		    @agent = Caliper::Entities::Entity.new
	    end
	  end
  end
end