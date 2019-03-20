// Initial wiring: [7, 6, 5, 2, 0, 8, 3, 4, 1]
// Resulting wiring: [7, 6, 5, 2, 0, 8, 3, 4, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[4];
cx q[0], q[5];
cx q[8], q[7];
cx q[7], q[4];
cx q[4], q[1];
cx q[2], q[1];
cx q[1], q[0];
cx q[4], q[1];
cx q[7], q[4];
cx q[4], q[7];
