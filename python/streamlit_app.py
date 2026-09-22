import streamlit as st
import pandas as pd
import joblib


# LOAD MODEL
model_1 = joblib.load("python/machine_failure_model.joblib")["model_1"]
model_2 = joblib.load("python/machine_failure_type_model.joblib")["model_2"]

st.title("Machine Failure Predictions")

#Sidebar for machine inputs
with st.sidebar:
    st.header("Machine Inputs")

## Main page
st.subheader("Selected Machine Values")

##Input columns
with st.sidebar:
    product_type = st.selectbox(
        "Product Type",
        ["H", "M", "L"]
    )
    air_temperature_k = st.number_input (
        "Air Temperature K",
        value = 290.0
    )
    process_temperature_k = st.number_input (
            "Process Temperature K",
            value = 300.0
        )
    rotational_speed_rpm = st.number_input (
            "Rotational Speed RPM",
            value = 1539.0
        )
    torque_nm = st.number_input (
            "Torque NM",
            value = 41.0
        )
    tool_wear_min = st.number_input (
            "Tool Wear min",
            value = 108
        )
    
    # Features that were engineered 
    machine_operating_process_k = (
        process_temperature_k - air_temperature_k
    )
    machanical_power = (
        torque_nm * rotational_speed_rpm
    )

# Table to display input values
model_input = pd.DataFrame({
    "product_type": [product_type],
    "air_temperature_k": [air_temperature_k],
    "process_temperature_k": [process_temperature_k],
    "rotational_speed_rpm": [rotational_speed_rpm],
    "torque_nm": [torque_nm],
    "tool_wear_min": [tool_wear_min],
    "machine_operating_process_k": [machine_operating_process_k],
    "machanical_power": [machanical_power]
})

st.dataframe(model_input.T.reset_index().rename(columns={"index": "Machine Input", 0: "Value"}),
             use_container_width=True, hide_index=True)

if st.button("Predict"):
    # Model 1 - use model_input NOT input_data
    failure_prediction = model_1.predict(model_input)[0]

    if failure_prediction == 0:
        st.success("No machine failure predicted.")
    else:
        st.warning("Machine failure predicted.")

        # Model 2 - use model_input NOT input_data
        failure_types = model_2.predict(model_input)[0]

        labels = ["Tool Wear Failure", "Power Failure", "Overstrain Failure"]

        predicted_failures = [
            label
            for label, prediction
            in zip(labels, failure_types)
            if prediction == 1
        ]

        if predicted_failures:
            st.subheader("Predicted Failure Type")

            for failure in predicted_failures:
                st.error(failure)

        else:
            st.info("Failure detected, but no specific failure type predicted")


