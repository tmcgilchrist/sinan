Feature: Make sinan distributable as an escript
  In order to make sinan distributable as an escript
  As an Erlang Developer
  I want sinan to not rely on anything in its priv directory

  Scenario: Have sinan gen run completely without relying on the priv dir
    Given a project generated by gen
    And sinan has nothing in its priv dir
    When a build step is run on this project
    Then sinan should build the app normally




