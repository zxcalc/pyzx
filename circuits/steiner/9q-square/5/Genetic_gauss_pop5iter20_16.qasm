// Initial wiring: [5 0 2 8 4 1 6 7 3]
// Resulting wiring: [5 0 2 8 4 1 6 7 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[2];
cx q[2], q[1];
cx q[3], q[4];
cx q[4], q[1];
cx q[8], q[3];
