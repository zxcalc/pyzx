// Initial wiring: [5 1 2 8 3 0 6 7 4]
// Resulting wiring: [5 1 2 8 3 0 6 7 4]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[4], q[1];
cx q[0], q[1];
cx q[7], q[6];
