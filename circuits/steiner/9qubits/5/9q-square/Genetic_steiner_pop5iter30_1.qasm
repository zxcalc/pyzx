// Initial wiring: [1, 3, 2, 5, 4, 7, 0, 8, 6]
// Resulting wiring: [1, 3, 2, 5, 4, 7, 0, 8, 6]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[2], q[3];
cx q[1], q[2];
cx q[6], q[7];
cx q[8], q[7];
cx q[2], q[1];
cx q[1], q[0];
cx q[2], q[1];
