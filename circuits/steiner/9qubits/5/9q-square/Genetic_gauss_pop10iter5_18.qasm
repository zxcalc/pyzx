// Initial wiring: [5 1 2 8 4 0 7 6 3]
// Resulting wiring: [5 1 2 8 4 0 7 6 3]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[3], q[2];
cx q[5], q[4];
cx q[4], q[5];
cx q[3], q[4];
cx q[4], q[7];
