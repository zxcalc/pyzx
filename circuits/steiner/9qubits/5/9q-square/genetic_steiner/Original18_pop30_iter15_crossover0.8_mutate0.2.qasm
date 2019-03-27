// Initial wiring: [1, 7, 5, 4, 2, 8, 3, 6, 0]
// Resulting wiring: [1, 7, 5, 4, 2, 8, 3, 6, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[5], q[0];
cx q[6], q[5];
cx q[5], q[4];
cx q[6], q[7];
cx q[4], q[5];
