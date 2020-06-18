@stand_alone_mode
Feature: Stand-alone Agent Mode
  Scenarios for a standalone mode Elastic Agent in Ingest Manager

@start-agent
Scenario: Starting the agent starts backend processes
  Given a stand-alone agent is deployed
  Then the "filebeat" process is "started" on the host
    And the "metricbeat" process is "started" on the host

@deploy-stand-alone
Scenario: Deploying a stand-alone agent
  Given Kibana and Elasticsearch are available
  When a stand-alone agent is deployed
  Then there is new data in the index from agent

@stop-agent
Scenario: Stopping the agent container stops data going into ES
  Given Kibana and Elasticsearch are available
    And a stand-alone agent is deployed
  When the "agent" docker container is stopped
  Then there is no new data in the index after agent shuts down
