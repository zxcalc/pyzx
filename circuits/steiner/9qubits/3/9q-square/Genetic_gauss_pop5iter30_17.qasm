// Initial wiring: [5 1 2 3 4 0 6 7 8]
// Resulting wiring: [5 1 2 3 4 0 6 7 8]
OPENQASM 2.0;
include "qelib1.inc";
qreg q[9];
cx q[7], q[6];
cx q[5], q[6];
cx q[3], q[4];
