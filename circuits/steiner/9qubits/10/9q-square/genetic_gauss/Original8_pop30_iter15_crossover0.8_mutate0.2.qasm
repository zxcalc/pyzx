// Initial wiring: [7, 4, 3, 0, 1, 8, 5, 6, 2]
// Resulting wiring: [7, 4, 3, 0, 1, 8, 5, 6, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[2];
cx q[7], q[6];
cx q[8], q[6];
cx q[8], q[0];
cx q[6], q[1];
cx q[7], q[8];
cx q[8], q[7];
cx q[1], q[5];
cx q[0], q[5];
cx q[5], q[8];
