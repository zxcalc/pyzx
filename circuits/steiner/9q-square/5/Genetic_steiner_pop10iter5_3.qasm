// Initial wiring: [8, 5, 4, 2, 0, 1, 6, 7, 3]
// Resulting wiring: [8, 5, 4, 2, 0, 1, 6, 7, 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[2];
cx q[5], q[6];
cx q[6], q[7];
cx q[7], q[8];
cx q[8], q[3];
cx q[7], q[8];
cx q[6], q[7];
