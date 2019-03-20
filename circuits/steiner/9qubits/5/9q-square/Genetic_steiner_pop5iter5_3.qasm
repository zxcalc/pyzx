// Initial wiring: [4, 5, 6, 1, 7, 8, 3, 2, 0]
// Resulting wiring: [4, 5, 6, 1, 7, 8, 3, 2, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[2], q[3];
cx q[3], q[4];
cx q[4], q[7];
cx q[3], q[4];
cx q[6], q[7];
cx q[2], q[3];
cx q[3], q[2];
cx q[1], q[0];
