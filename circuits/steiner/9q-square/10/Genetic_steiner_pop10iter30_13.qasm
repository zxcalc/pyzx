// Initial wiring: [7, 2, 5, 8, 1, 4, 3, 6, 0]
// Resulting wiring: [7, 2, 5, 8, 1, 4, 3, 6, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[4];
cx q[0], q[1];
cx q[5], q[6];
cx q[0], q[5];
cx q[7], q[8];
cx q[8], q[7];
cx q[7], q[6];
cx q[4], q[3];
