// Initial wiring: [5, 1, 8, 2, 4, 0, 3, 7, 6]
// Resulting wiring: [5, 1, 8, 2, 4, 0, 3, 7, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[5], q[0];
cx q[7], q[6];
cx q[6], q[0];
cx q[6], q[1];
cx q[5], q[6];
cx q[0], q[5];
cx q[5], q[7];
