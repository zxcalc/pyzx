// Initial wiring: [8, 0, 5, 6, 2, 3, 1, 7, 4]
// Resulting wiring: [8, 0, 5, 6, 2, 3, 1, 7, 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[6], q[7];
cx q[8], q[3];
cx q[3], q[2];
cx q[5], q[0];
cx q[6], q[5];
