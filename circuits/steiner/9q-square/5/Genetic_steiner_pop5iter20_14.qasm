// Initial wiring: [2, 0, 1, 8, 7, 3, 5, 6, 4]
// Resulting wiring: [2, 0, 1, 8, 7, 3, 5, 6, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[4];
cx q[7], q[8];
cx q[6], q[7];
cx q[7], q[8];
cx q[7], q[6];
cx q[5], q[0];
cx q[6], q[5];
cx q[7], q[6];
