# parallel_heusristic_search


import pytest

def test_drift_map_application():
    # Test case for 'data drift'
    monitoring_data_drift = {
        "name": "dataset_1",
        "metric": "data drift",
        "method": "Kolmogorov-Smirnov"
    }
    drift_map = {}
    result = drift_map_application(monitoring_data_drift, drift_map)
    assert result == {"dataset_1": "Kolmogorov-Smirnov"}
    
    # Test case for 'feature drift'
    monitoring_feature_drift = {
        "name": "dataset_2",
        "metric": "feature drift",
        "method": "Chi-Square Test"
    }
    drift_map = {}
    result = drift_map_application(monitoring_feature_drift, drift_map)
    assert result == {"dataset_2": "Chi-Square Test"}
    
    # Test case for 'target drift'
    monitoring_target_drift = {
        "name": "dataset_3",
        "metric": "target drift",
        "method": "KL Divergence"
    }
    drift_map = {}
    result = drift_map_application(monitoring_target_drift, drift_map)
    assert result == {"dataset_3": "KL Divergence"}
    
    # Test case for 'classification performance'
    monitoring_classification = {
        "name": "dataset_4",
        "metric": "classification performance",
        "method": "F1 Score"
    }
    drift_map = {}
    result = drift_map_application(monitoring_classification, drift_map)
    assert result == {"dataset_4": "F1 Score"}
    
    # Test case for unknown metric
    monitoring_unknown = {
        "name": "dataset_5",
        "metric": "unknown metric",
        "method": "Unknown Method"
    }
    drift_map = {}
    result = drift_map_application(monitoring_unknown, drift_map)
    assert result == {}  # Expect the drift map to remain empty for unknown metrics

