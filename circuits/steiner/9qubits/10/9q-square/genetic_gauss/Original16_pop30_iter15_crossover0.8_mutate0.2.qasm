// Initial wiring: [2, 0, 8, 3, 7, 5, 4, 6, 1]
// Resulting wiring: [2, 0, 8, 3, 7, 5, 4, 6, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[5], q[3];
cx q[6], q[4];
cx q[8], q[6];
cx q[7], q[2];
cx q[7], q[5];
cx q[3], q[5];
cx q[1], q[2];
cx q[5], q[8];
cx q[2], q[7];
cx q[3], q[6];
