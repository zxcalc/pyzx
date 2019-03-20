// Initial wiring: [8, 1, 5, 6, 2, 3, 0, 7, 4]
// Resulting wiring: [8, 1, 5, 6, 2, 3, 0, 7, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[4];
cx q[5], q[6];
cx q[4], q[5];
cx q[6], q[7];
cx q[5], q[6];
