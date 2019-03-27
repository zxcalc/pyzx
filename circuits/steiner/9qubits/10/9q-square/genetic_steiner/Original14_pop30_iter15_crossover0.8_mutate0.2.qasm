// Initial wiring: [1, 4, 2, 6, 0, 3, 7, 5, 8]
// Resulting wiring: [1, 4, 2, 6, 0, 3, 7, 5, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[6], q[5];
cx q[5], q[0];
cx q[7], q[6];
cx q[6], q[7];
cx q[5], q[6];
cx q[6], q[7];
cx q[4], q[7];
cx q[4], q[5];
cx q[7], q[4];
