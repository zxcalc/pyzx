// Initial wiring: [7, 6, 5, 3, 2, 1, 4, 8, 0]
// Resulting wiring: [7, 6, 5, 3, 2, 1, 4, 8, 0]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[4];
cx q[5], q[6];
cx q[4], q[7];
cx q[1], q[4];
cx q[4], q[7];
cx q[3], q[8];
cx q[1], q[0];
cx q[4], q[1];
