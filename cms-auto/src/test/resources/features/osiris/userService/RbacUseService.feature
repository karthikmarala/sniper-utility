
Feature: Verify the RBAC feature

  @rbac_userservice
  # scope/create and GET scope/{id}
  Scenario: Verify by creating scope and validate GET response
    Given I create scopes with :
      | scopeGroupNumber | scopeKey        | scopeValue |
      | 1                | contentProvider | Airtel     |
    And I verify the same values reflecting in scope response

  @rbac_userservice
   # scopeGroup/create and GET scopeGroup/{id}
  Scenario: Verify by creating a scope group and validate GET response
    Given I create scopes with :
      | scopeGroupNumber | scopeKey        | scopeValue |
      | 1                | studio          | FOX        |
      | 1                | contentProvider | Airtel     |
      | 2                | productionHouse | StarGold   |
    And I create a scope group with the above created scopes and validate GET response
      | scopeGroupNumber | Name                    | Description             |
      | 1                | scopeGroupWithFoxAirtel | scopeGroupWithFoxAirtel |
      | 2                | scopeGroupWithStarGold  | scopeGroupWithStarGold  |

  @rbac_userservice
   # scopeGroup/update and GET scopeGroup/{id}
  Scenario: Verify by updating a scope group and validate GET response
    Given I create scopes with :
      | scopeGroupNumber | scopeKey        | scopeValue |
      | 1                | studio          | FOX        |
      | 1                | contentProvider | Airtel     |
    And I create a scope group with the above created scopes and validate GET response
      | scopeGroupNumber | Name                    | Description             |
      | 1                | scopeGroupWithFoxAirtel | scopeGroupWithFoxAirtel |
    Then I update a scope group with the above created scopes and validate GET response
      | scopeGroupNumber | Name                          | Description                   |
      | 1                | scopeGroupWithFoxAirtelUpdate | scopeGroupWithFoxAirtelUpdate |


  @rbac_userservice
    # field/create and GET field/getAll
  Scenario: Verify by creating fields and validate GET response
    Given I create fields with :
      | fieldGroupNumber | action | resource           | effect |
      | 1                | CREATE | cmsEpisodeResponse | ALLOW  |
      | 1                | UPDATE | cmsEpisodeResponse | DENY   |
      | 1                | READ   | cmsEpisodeResponse | ALLOW  |
    And I verify the same values reflecting in fields getAll api

  @rbac_userservice
       # fieldGroup/create
  Scenario: Verify by creating a field group and validate GET response
    Given I create fields with :
      | fieldGroupNumber | action | resource           | effect |
      | 1                | CREATE | cmsEpisodeResponse | ALLOW  |
      | 1                | UPDATE | cmsEpisodeResponse | DENY   |
      | 1                | READ   | cmsEpisodeResponse | ALLOW  |
      | 2                | READ   | cmsEpisodeResponse | ALLOW  |
    And I verify the same values reflecting in fields getAll api
    And I create a field group with the above created fields and validate GET response
      | fieldGroupNumber | Name                    | Description             |
      | 1                | fieldGroupWithFoxAirtel | fieldGroupWithFoxAirtel |
      | 2                | fieldGroupWithStarGold  | fieldGroupWithFoxAirtel |

  @rbac_userservice
  Scenario: Verify by updating a field group and validate GET response
    Given I create fields with :
      | fieldGroupNumber | action | resource           | effect |
      | 1                | CREATE | cmsEpisodeResponse | ALLOW  |
      | 1                | UPDATE | cmsEpisodeResponse | DENY   |
      | 1                | READ   | cmsEpisodeResponse | ALLOW  |
      | 2                | READ   | cmsEpisodeResponse | ALLOW  |
    And I verify the same values reflecting in fields getAll api
    And I create a field group with the above created fields and validate GET response
      | fieldGroupNumber | Name                    | Description             |
      | 1                | fieldGroupWithFoxAirtel | fieldGroupWithFoxAirtel |
      | 2                | fieldGroupWithStarGold  | fieldGroupWithFoxAirtel |
    Then I update a field group with the above created fields and validate GET response
      | fieldGroupNumber | Name                          | Description                   |
      | 1                | scopeGroupWithFoxAirtelUpdate | scopeGroupWithFoxAirtelUpdate |

  @rbac_userservice
  Scenario: Create a policy and validate the response
    Given I create scopes with :
      | scopeGroupNumber | scopeKey | scopeValue |
      | 1                | studio   | Disney     |
    And I create a scope group with the above created scopes and validate GET response
      | scopeGroupNumber | Name                 | Description          |
      | 1                | scopeGroupWithDisney | scopeGroupWithDisney |
    Given  I create fields with :
      | fieldGroupNumber | action | resource           | effect |
      | 1                | READ   | cmsEpisodeResponse | ALLOW  |
      | 1                | UPDATE | cmsEpisodeResponse | DENY   |
      | 1                | DELETE | cmsEpisodeResponse | ALLOW  |
    And I create a field group with the above created fields and validate GET response
      | fieldGroupNumber | Name                 | Description          |
      | 1                | fieldGroupWithDisney | fieldGroupWithDiensy |
    Then I create a policy with the below fieldGroup and scopeGroup and validate response
      | scopeGroupNumber | fieldGroupNumber | Name    | Description                                         |
      | 1                | 1                | policy1 | this policy will allow only Disney+ users to UPDATE |
    # riole
  # user














