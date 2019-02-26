// Initial wiring: [6, 2, 1, 0, 3, 4, 8, 7, 5]
// Resulting wiring: [6, 2, 1, 0, 3, 4, 8, 7, 5]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[4];
cx q[4], q[7];
cx q[3], q[4];
cx q[7], q[8];
cx q[4], q[7];
cx q[7], q[4];
cx q[8], q[7];
cx q[4], q[3];
cx q[3], q[2];
cx q[8], q[3];
cx q[4], q[3];
