// Initial wiring: [7, 6, 4, 1, 3, 5, 8, 2, 0]
// Resulting wiring: [7, 6, 4, 1, 3, 5, 8, 2, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[2], q[3];
cx q[6], q[7];
cx q[4], q[7];
cx q[7], q[8];
cx q[6], q[7];
cx q[7], q[8];
cx q[8], q[3];
cx q[1], q[0];
