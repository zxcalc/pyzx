// Initial wiring: [8, 6, 3, 1, 7, 0, 5, 2, 4]
// Resulting wiring: [8, 6, 3, 1, 7, 0, 5, 2, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[0], q[1];
cx q[1], q[4];
cx q[0], q[1];
cx q[3], q[4];
cx q[1], q[4];
cx q[4], q[7];
cx q[3], q[4];
cx q[6], q[7];
cx q[4], q[7];
cx q[7], q[8];
cx q[6], q[7];
cx q[7], q[8];
cx q[1], q[0];
cx q[4], q[1];
