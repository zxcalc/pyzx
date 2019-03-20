// Initial wiring: [0, 6, 7, 3, 1, 4, 2, 5, 8]
// Resulting wiring: [0, 6, 7, 3, 1, 4, 2, 5, 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[2];
cx q[3], q[4];
cx q[1], q[4];
cx q[6], q[7];
cx q[8], q[7];
cx q[3], q[2];
cx q[2], q[3];
cx q[2], q[1];
cx q[3], q[2];
cx q[2], q[3];
cx q[1], q[0];
