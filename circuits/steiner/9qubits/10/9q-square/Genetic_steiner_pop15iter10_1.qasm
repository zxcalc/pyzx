// Initial wiring: [6, 8, 7, 1, 3, 5, 0, 4, 2]
// Resulting wiring: [6, 8, 7, 1, 3, 5, 0, 4, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[2], q[3];
cx q[1], q[2];
cx q[2], q[3];
cx q[6], q[7];
cx q[3], q[8];
cx q[2], q[3];
cx q[3], q[8];
cx q[4], q[3];
cx q[2], q[1];
cx q[3], q[2];
cx q[1], q[0];
cx q[2], q[1];
cx q[5], q[0];
cx q[3], q[2];
