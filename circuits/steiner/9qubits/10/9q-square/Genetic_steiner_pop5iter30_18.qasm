// Initial wiring: [7, 2, 5, 8, 0, 3, 6, 1, 4]
// Resulting wiring: [7, 2, 5, 8, 0, 3, 6, 1, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[2];
cx q[5], q[6];
cx q[6], q[7];
cx q[5], q[6];
cx q[0], q[5];
cx q[5], q[4];
cx q[3], q[2];
cx q[5], q[0];
cx q[6], q[5];
cx q[5], q[6];
