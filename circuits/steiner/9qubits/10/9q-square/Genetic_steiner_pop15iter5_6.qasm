// Initial wiring: [7, 8, 2, 4, 6, 5, 0, 3, 1]
// Resulting wiring: [7, 8, 2, 4, 6, 5, 0, 3, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[2];
cx q[0], q[1];
cx q[1], q[4];
cx q[0], q[1];
cx q[1], q[4];
cx q[4], q[5];
cx q[3], q[4];
cx q[4], q[5];
cx q[4], q[7];
cx q[1], q[4];
cx q[0], q[1];
cx q[1], q[4];
cx q[7], q[6];
cx q[7], q[4];
