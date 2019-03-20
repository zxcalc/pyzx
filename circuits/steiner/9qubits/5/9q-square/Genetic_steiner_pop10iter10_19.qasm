// Initial wiring: [1, 6, 8, 5, 4, 0, 3, 7, 2]
// Resulting wiring: [1, 6, 8, 5, 4, 0, 3, 7, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[4];
cx q[4], q[5];
cx q[5], q[6];
cx q[4], q[5];
cx q[1], q[4];
cx q[6], q[7];
