# parallel_heusristic_search

```
import pytest
from unittest.mock import MagicMock, patch
import pandas as pd

@patch('your_module.check_unicity_id')
@patch('your_module.check_variables')
@patch('your_module.check_message_type')
@patch('your_module.check_policy_id')
@patch('your_module.check_probabilities')
def test_validate_data(mock_check_probabilities, mock_check_policy_id, mock_check_message_type, mock_check_variables, mock_check_unicity_id):
    # Define expected results for each mock function
    mock_check_unicity_id.return_value = "Valid"
    mock_check_variables.return_value = "Valid"
    mock_check_message_type.return_value = "Invalid"
    mock_check_policy_id.return_value = "Valid"
    mock_check_probabilities.return_value = "Valid"

    # Mock data context and inputs
    data_ge = MagicMock()
    proba_risk_cols = ["risk_1", "risk_2"]
    usecase = "test_usecase"

    # Expected DataFrame output
    expected_df = pd.DataFrame({
        "Checkpoints": [
            "Incidents ID unicity",
            "Variables check",
            "Message type check",
            "Policy check",
            "Probabilities between 0 and 1"
        ],
        "Results": ["Valid", "Valid", "Invalid", "Valid", "Valid"]
    })

    # Run the validate_data function
    result_df = validate_data(data_ge, proba_risk_cols, usecase)

    # Assert that the output DataFrame matches the expected DataFrame
    pd.testing.assert_frame_equal(result_df, expected_df)

    # Check that each validation function was called once with the correct arguments
    mock_check_unicity_id.assert_called_once_with(data_ge)
    mock_check_variables.assert_called_once_with(data_ge, usecase)
    mock_check_message_type.assert_called_once_with(data_ge)
    mock_check_policy_id.assert_called_once_with(data_ge)
    mock_check_probabilities.assert_called_once_with(data_ge, proba_risk_cols, usecase)

```