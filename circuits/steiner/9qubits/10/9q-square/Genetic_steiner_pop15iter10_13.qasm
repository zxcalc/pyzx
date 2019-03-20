// Initial wiring: [7, 1, 2, 8, 5, 4, 3, 0, 6]
// Resulting wiring: [7, 1, 2, 8, 5, 4, 3, 0, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[2];
cx q[0], q[1];
cx q[2], q[3];
cx q[1], q[2];
cx q[5], q[6];
cx q[0], q[5];
cx q[7], q[6];
cx q[8], q[7];
cx q[7], q[8];
cx q[2], q[1];
