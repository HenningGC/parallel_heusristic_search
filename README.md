# parallel_heusristic_search

import pytest
from unittest.mock import MagicMock

# Mock validation functions
def check_unicity_id(data_ge):
    return "Passed"

def check_variables(data_ge, usecase):
    return "Passed"

def check_message_type(data_ge):
    return "Failed"

def check_policy_id(data_ge):
    return "Passed"

def check_probabilities(data_ge, proba_risk_cols, usecase):
    return "Passed"

def test_validate_data():
    # Mock Great Expectations data context
    data_ge = MagicMock()
    proba_risk_cols = ["risk_1", "risk_2"]
    usecase = "test_usecase"
    
    # Expected DataFrame
    expected_df = pd.DataFrame({
        "Checkpoints": [
            "Incidents ID unicity",
            "Variables check",
            "Message type check",
            "Policy check",
            "Probabilities between 0 and 1"
        ],
        "Results": ["Passed", "Passed", "Failed", "Passed", "Passed"]
    })
    
    # Run the function
    result_df = validate_data(data_ge, proba_risk_cols, usecase)
    
    # Assert DataFrame equality
    pd.testing.assert_frame_equal(result_df, expected_df)
