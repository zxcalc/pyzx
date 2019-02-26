// Initial wiring: [7, 4, 5, 6, 3, 8, 2, 1, 0]
// Resulting wiring: [7, 4, 5, 6, 3, 8, 2, 1, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[5];
cx q[6], q[7];
cx q[5], q[6];
cx q[4], q[7];
cx q[6], q[7];
cx q[6], q[5];
cx q[4], q[3];
