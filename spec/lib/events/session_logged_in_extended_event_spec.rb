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

require 'spec_helper'

describe Caliper::Events::SessionEvent do
  subject do
    described_class.new(
      action: Caliper::Actions::LOGGED_IN,
      actor: actor,
      edApp: object,
      eventTime: '2016-11-15T20:11:15.000Z',
      id: 'urn:uuid:4ec2c31e-3ec0-4fe1-a017-b81561b075d7',
      object: object,
      session: session
    )
  end

  let(:actor) do
    Caliper::Entities::Agent::Person.new(
      id: 'https://example.edu/users/554433'
    )
  end

  let(:object) do
    Caliper::Entities::Agent::SoftwareApplication.new(
      id: 'https://example.edu',
      version: 'v2'
    )
  end

  let(:session) do
    Caliper::Entities::Session::Session.new(
      id: 'https://example.edu/sessions/1f6442a482de72ea6ad134943812bff564a76259',
      user: actor,
      dateCreated: '2016-11-15T20:11:15.000Z',
      startedAtTime: '2016-11-15T20:11:15.000Z',
      extensions: extensions
    )
  end

  let(:extensions) do
    {
      request: {
        id: 'd71016dc-ed2f-46f9-ac2c-b93f15f38fdc',
        hostname: 'example.com',
        userAgent: 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_0) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/53.0.2785.143 Safari/537.36'
      }
    }
  end

  include_examples 'validation against common fixture', 'caliperEventSessionLoggedInExtended.json'
end
