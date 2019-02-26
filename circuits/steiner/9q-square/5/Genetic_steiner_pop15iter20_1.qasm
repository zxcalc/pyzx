// Initial wiring: [7, 1, 4, 3, 2, 5, 0, 8, 6]
// Resulting wiring: [7, 1, 4, 3, 2, 5, 0, 8, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[5];
cx q[6], q[7];
cx q[8], q[7];
cx q[4], q[1];
cx q[3], q[4];
