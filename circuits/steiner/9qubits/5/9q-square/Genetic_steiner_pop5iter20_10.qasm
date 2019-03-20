// Initial wiring: [8, 2, 0, 7, 1, 5, 6, 3, 4]
// Resulting wiring: [8, 2, 0, 7, 1, 5, 6, 3, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[1];
cx q[4], q[7];
cx q[6], q[7];
cx q[3], q[4];
cx q[7], q[8];
