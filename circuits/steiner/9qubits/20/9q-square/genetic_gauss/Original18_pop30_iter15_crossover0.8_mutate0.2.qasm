// Initial wiring: [5, 1, 7, 8, 0, 6, 2, 3, 4]
// Resulting wiring: [5, 1, 7, 8, 0, 6, 2, 3, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[2], q[1];
cx q[3], q[0];
cx q[4], q[0];
cx q[5], q[4];
cx q[7], q[4];
cx q[8], q[7];
cx q[8], q[6];
cx q[7], q[3];
cx q[0], q[4];
cx q[5], q[8];
cx q[4], q[6];
