// Initial wiring: [8, 6, 7, 5, 2, 0, 3, 4, 1]
// Resulting wiring: [8, 6, 7, 5, 2, 0, 3, 4, 1]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[1], q[2];
cx q[8], q[7];
cx q[6], q[5];
cx q[1], q[0];
cx q[4], q[1];
