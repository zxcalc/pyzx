// Initial wiring: [1, 6, 7, 5, 3, 0, 8, 4, 2]
// Resulting wiring: [1, 6, 7, 5, 3, 0, 8, 4, 2]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[7];
cx q[3], q[4];
cx q[1], q[4];
cx q[4], q[7];
cx q[7], q[4];
cx q[5], q[4];
cx q[4], q[3];
cx q[3], q[2];
cx q[4], q[3];
cx q[3], q[4];
