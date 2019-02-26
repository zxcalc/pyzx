// Initial wiring: [7, 4, 0, 2, 5, 1, 8, 3, 6]
// Resulting wiring: [7, 4, 0, 2, 5, 1, 8, 3, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[2], q[3];
cx q[6], q[7];
cx q[4], q[7];
cx q[7], q[8];
cx q[6], q[7];
cx q[7], q[8];
cx q[6], q[5];
cx q[4], q[1];
