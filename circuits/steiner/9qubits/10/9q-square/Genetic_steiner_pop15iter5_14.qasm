// Initial wiring: [4, 1, 6, 8, 0, 3, 5, 7, 2]
// Resulting wiring: [4, 1, 6, 8, 0, 3, 5, 7, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[5], q[6];
cx q[6], q[7];
cx q[4], q[7];
cx q[7], q[6];
cx q[6], q[7];
cx q[6], q[5];
cx q[7], q[6];
cx q[5], q[4];
cx q[6], q[5];
cx q[4], q[1];
cx q[5], q[4];
cx q[6], q[5];
