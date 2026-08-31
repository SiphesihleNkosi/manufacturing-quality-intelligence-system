import streamlit as st

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
        value = 300
    )
