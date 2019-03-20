// Initial wiring: [1, 8, 5, 6, 7, 2, 0, 3, 4]
// Resulting wiring: [1, 8, 5, 6, 7, 2, 0, 3, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[5];
cx q[6], q[7];
cx q[5], q[6];
cx q[7], q[4];
cx q[6], q[7];
