// Initial wiring: [1, 2, 4, 5, 3, 7, 8, 0, 6]
// Resulting wiring: [1, 2, 4, 5, 3, 7, 8, 0, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[2];
cx q[2], q[3];
cx q[1], q[2];
cx q[2], q[3];
cx q[8], q[7];
cx q[7], q[6];
cx q[8], q[7];
cx q[1], q[0];
cx q[4], q[1];
