// Initial wiring: [2, 5, 7, 0, 6, 4, 1, 8, 3]
// Resulting wiring: [2, 5, 7, 0, 6, 4, 1, 8, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[7], q[8];
cx q[6], q[7];
cx q[5], q[6];
cx q[6], q[5];
cx q[5], q[0];
cx q[6], q[5];
cx q[7], q[6];
cx q[5], q[6];
