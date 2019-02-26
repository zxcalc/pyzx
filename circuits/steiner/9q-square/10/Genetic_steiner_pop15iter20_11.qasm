// Initial wiring: [3, 8, 0, 6, 7, 2, 5, 1, 4]
// Resulting wiring: [3, 8, 0, 6, 7, 2, 5, 1, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[4];
cx q[5], q[6];
cx q[0], q[5];
cx q[5], q[6];
cx q[4], q[7];
cx q[3], q[4];
cx q[3], q[8];
cx q[5], q[4];
