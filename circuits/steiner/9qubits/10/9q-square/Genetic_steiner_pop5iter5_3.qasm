// Initial wiring: [0, 8, 5, 4, 7, 6, 1, 3, 2]
// Resulting wiring: [0, 8, 5, 4, 7, 6, 1, 3, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[1];
cx q[3], q[4];
cx q[2], q[3];
cx q[3], q[4];
cx q[4], q[5];
cx q[0], q[5];
cx q[5], q[6];
cx q[4], q[5];
cx q[3], q[4];
cx q[2], q[3];
cx q[0], q[5];
cx q[3], q[4];
cx q[4], q[5];
cx q[6], q[7];
cx q[4], q[7];
cx q[5], q[6];
cx q[1], q[4];
cx q[4], q[3];
cx q[1], q[0];
