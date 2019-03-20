// Initial wiring: [4, 1, 5, 3, 7, 2, 8, 0, 6]
// Resulting wiring: [4, 1, 5, 3, 7, 2, 8, 0, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[2];
cx q[4], q[5];
cx q[4], q[7];
cx q[7], q[8];
cx q[4], q[7];
cx q[3], q[8];
cx q[8], q[3];
cx q[4], q[3];
cx q[3], q[2];
cx q[8], q[3];
cx q[3], q[8];
