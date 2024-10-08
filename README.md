# parallel_heusristic_search

```
import pytest
from unittest.mock import MagicMock

def test_check_variables():
    # Mock data_ge and expected methods
    data_ge = MagicMock()
    data_ge.expect_column_to_exist.return_value = {"success": True}
    
    # Test for business_practice use case
    parameters_utils.features_expected = ["feature_1", "feature_2"]
    assert check_variables(data_ge, "business_practice") == "Valid"
    
    # Test for missing column
    data_ge.expect_column_to_exist.side_effect = [{"success": True}, {"success": False}]
    assert check_variables(data_ge, "business_practice") == "Invalid"

def test_check_unicity_id():
    # Mock data_ge
    data_ge = MagicMock()
    data_ge.expect_column_values_to_be_unique.return_value = {"success": True}
    
    assert check_unicity_id(data_ge) == "Valid"
    
    # Test for non-unique ID
    data_ge.expect_column_values_to_be_unique.return_value = {"success": False}
    assert check_unicity_id(data_ge) == "Invalid"

def test_check_message_type():
    # Mock data_ge
    data_ge = MagicMock()
    data_ge.expect_column_values_to_be_in_set.return_value = {"success": True}
    
    assert check_message_type(data_ge) == "Valid"
    
    # Test for invalid message type
    data_ge.expect_column_values_to_be_in_set.return_value = {"success": False}
    assert check_message_type(data_ge) == "Invalid"

def test_check_policy_id():
    # Mock data_ge
    data_ge = MagicMock()
    data_ge.expect_column_values_to_be_in_set.return_value = {"success": True}
    
    assert check_policy_id(data_ge) == "Valid"
    
    # Test for invalid policy ID
    data_ge.expect_column_values_to_be_in_set.return_value = {"success": False}
    assert check_policy_id(data_ge) == "Invalid"

def test_check_probabilities():
    # Mock data_ge
    data_ge = MagicMock()
    data_ge.expect_column_values_to_be_between.return_value = {"success": True}
    
    # Test for business_practice use case
    assert check_probabilities(data_ge, [], "business_practice") == "Valid"
    
    # Test for other use cases with valid columns
    proba_risk_cols = ["col1", "col2"]
    assert check_probabilities(data_ge, proba_risk_cols, "other") == "Valid"
    
    # Test for invalid probability range
    data_ge.expect_column_values_to_be_between.side_effect = [{"success": True}, {"success": False}]
    assert check_probabilities(data_ge, proba_risk_cols, "other") == "Invalid"

```