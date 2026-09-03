import streamlit as st
import pandas as pd

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
input_data = pd.DataFrame({
        "Machine Input": [
        "Prodct Type",
        "Air Temperature K",
        "Process Temperature K",
        "Rotational Speed RPM",
        "Torque NM",
        "Tool Wear min"
    ],

    "Value": [
        product_type,
        air_temperature_k,
        process_temperature_k,
        rotational_speed_rpm,
        torque_nm,
        tool_wear_min
    ]
})
st.dataframe(input_data)

st.subheader("Prediction")
predict_button = st.button("Predict Machine Failure",
                           type="primary")
if predict_button:
    st.success("Prediction will appear here")