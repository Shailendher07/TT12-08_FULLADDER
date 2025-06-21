import cocotb
from cocotb.clock import Clock
from cocotb.triggers import ClockCycles, Timer


@cocotb.test()
async def test_project(dut):
    dut._log.info("Start")

    # Create 10 MHz clock -> 100 ns period
    clock = Clock(dut.clk, 100, units="ns")
    cocotb.start_soon(clock.start())

    # Initialize signals
    dut.ena.value = 0
    dut.rst_n.value = 1
    dut.ui_in.value = 0  # Not strictly needed, but safe to leave at 0
    dut.uio_in.value = 0  # Not strictly needed, but safe to leave at 0

    # Apply reset sequence as in your Verilog TB
    dut._log.info("Applying reset pattern")
    await Timer(100, units="ns")
    dut.rst_n.value = 0

    await Timer(1000, units="ns")
    dut.rst_n.value = 1

    await Timer(100, units="ns")
    dut.rst_n.value = 0

    # Enable the DUT
    dut.ena.value = 1

    # Observe the ring counter output over several cycles
    for i in range(10):
        await ClockCycles(dut.clk, 1)
        dut._log.info(f"Cycle {i}: uo_out = {dut.uo_out.value.binstr}")

    # Add asserts if you know expected ring counter output at each stage
    # Example (replace with correct expected value):
    # assert dut.uo_out.value == expected_val
